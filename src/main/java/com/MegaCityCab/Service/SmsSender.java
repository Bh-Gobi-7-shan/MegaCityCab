package com.MegaCityCab.Service;

import org.json.JSONObject;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.secretsmanager.SecretsManagerClient;
import software.amazon.awssdk.services.secretsmanager.model.GetSecretValueRequest;
import software.amazon.awssdk.services.secretsmanager.model.GetSecretValueResponse;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class SmsSender{
    private static final String API_URL = "https://app.text.lk/api/v3/sms/send";
    private static final String API_TOKEN = getSecretKey();


    public static String getSecretKey() {
        String secretName = "/MegaCityCab/api_key";
        Region region = Region.of("us-east-2");

        try {
            SecretsManagerClient client = SecretsManagerClient.builder().region(region).build();
            GetSecretValueRequest getSecretValueRequest = GetSecretValueRequest.builder().secretId(secretName).build();

            GetSecretValueResponse getSecretValueResponse = client.getSecretValue(getSecretValueRequest);
            String secret = getSecretValueResponse.secretString();
            JSONObject jsonObject = new JSONObject(secret);
            return jsonObject.getString("api_key");
        }
        catch (Exception e) {
            System.err.println("Error in Getting SMS API key from AWS Because: " + e);
        }
        return null;
    }

    public boolean sendSMS(String phoneNumber, String message) {
        HttpURLConnection connection = null;
        try {

            URL url = new URL(API_URL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "Bearer " + API_TOKEN);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Accept", "application/json");
            connection.setDoOutput(true);

            // Create JSON request body
            JSONObject jsonBody = new JSONObject();
            jsonBody.put("recipient", phoneNumber);
            jsonBody.put("sender_id", "TextLKDemo");
            jsonBody.put("message", message);

            // Send request
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonBody.toString().getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // Get response
            int statusCode = connection.getResponseCode();
            if (statusCode == HttpURLConnection.HTTP_OK) {
                System.out.println("SMS sent successfully.");
                return true;
            }
            else {
                System.err.println("Failed to send SMS. Response Code: " + statusCode);
                return false;
            }

        }

        catch (Exception e) {
            System.err.println("Failed in Main send sms method: " + e);
            return false;
        }
        finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

}
