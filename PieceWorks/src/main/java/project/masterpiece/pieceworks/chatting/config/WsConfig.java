package project.masterpiece.pieceworks.chatting.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


import project.masterpiece.pieceworks.chatting.controller.ChatWebSocketHandler;


@Configuration
@EnableWebSocket
public class WsConfig implements WebSocketConfigurer {
	

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler(), "/chat-ws.ch");
	}
	
	@Bean
	public ChatWebSocketHandler chatHandler() {
		return new ChatWebSocketHandler();
	}
	
}
