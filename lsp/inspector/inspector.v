module lsp

import time

pub enum MessageKind {
	send_notification
	recv_notification
	send_request
	recv_request
	send_response
	recv_response
}

pub fn (mk MessageKind) str() string {
	return match mk {
		send_notification { 'send-notification' }
		recv_notification { 'recv-notification' }
		send_request { 'send-request' }
		recv_request { 'recv-request' }
		send_response { 'send-response' }
		recv_response { 'recv-response' }
	}
}

pub fn log(encoded_message string, typ MessageKind) string {
	timestamp := time.now().unix_time()
	return '{"type":"$typ","message":$encoded_message,"timestamp":$timestamp}'
}
