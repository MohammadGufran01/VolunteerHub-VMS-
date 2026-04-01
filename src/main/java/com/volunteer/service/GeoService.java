package com.volunteer.service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GeoService {

    private static final String API_KEY = "pk.055faac6e03cd988b604ab38d151dc02";

    public double[] getLatLng(String address) {

        try {
            String url = "https://us1.locationiq.com/v1/search?format=json&q="
                    + URLEncoder.encode(address, StandardCharsets.UTF_8)
                    + "&key=" + API_KEY;

            RestTemplate restTemplate = new RestTemplate();

            // REQUIRED headers
            HttpHeaders headers = new HttpHeaders();
            headers.set("User-Agent", "VolunteerGeoApp/1.0");
            headers.set("Accept", "application/json");

            HttpEntity<Void> entity = new HttpEntity<>(headers);

            ResponseEntity<String> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    String.class
            );

            if (response.getStatusCode() != HttpStatus.OK) {
                throw new RuntimeException("Geo API failed");
            }

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());

            if (root == null || root.size() == 0) {
                throw new RuntimeException("Location not found");
            }

            JsonNode first = root.get(0);

            double lat = first.get("lat").asDouble();
            double lon = first.get("lon").asDouble();

            
            return new double[]{lat, lon};

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Invalid address or Geo service blocked. Enter full Google Maps address.");
        }
    }
}
