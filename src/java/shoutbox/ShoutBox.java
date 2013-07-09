/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package shoutbox;

/**
 *
 * @author ADMIN
 */
public class ShoutBox {
    private static String chatHistory;

    public static String getChatHistory() {
        return chatHistory;
    }

    public static void setChatHistory(String chatHistory) {
        ShoutBox.chatHistory = chatHistory;
    }
    
    
}
