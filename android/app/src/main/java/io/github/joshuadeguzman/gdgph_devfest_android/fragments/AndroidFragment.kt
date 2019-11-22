package io.github.joshuadeguzman.gdgph_devfest_android.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.github.joshuadeguzman.gdgph_devfest_android.App
import io.github.joshuadeguzman.gdgph_devfest_android.R
import kotlinx.android.synthetic.main.fragment_android.*

class AndroidFragment : Fragment() {
    lateinit var embeddedMessagesChannel: BasicMessageChannel<String>

    companion object {
        fun newInstance() = AndroidFragment()
    }


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_android, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Instantiate message channel.
        embeddedMessagesChannel = BasicMessageChannel<String>(
            (activity?.application as App).engineEmbedded.dartExecutor,
            "channel-embedded-messages",
            StringCodec.INSTANCE
        )

        // Receive messages from Dart.
        embeddedMessagesChannel.setMessageHandler { message, reply ->
            tvMessageFromFlutter.text = message.toString()
            // You can also send replies immediately to dart after receiving a message callback
            // reply.reply()
        }

        // Send messages to Flutter
        btSendFlutterMessage.setOnClickListener {
            if(etMessageToFlutter.text.isNullOrEmpty()) {
                etMessageToFlutter.error = "Message is required!"
            } else {
                embeddedMessagesChannel.send(etMessageToFlutter.text.toString())
            }
        }
    }
}

