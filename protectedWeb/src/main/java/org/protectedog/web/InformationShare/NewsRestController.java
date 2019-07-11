package org.protectedog.web.InformationShare;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/News/*")
public class NewsRestController {

	public static void main(String[] args) {
		
		String clientId = "ilVhCqg4sQywtqFTKwUk";
		String clientSecret = "yzKmjY0Bzm";
		try {
			String text = URLEncoder.encode("반려동물", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text
					+ "&display=10&start=1&sort=date"; // ������ json ���
			
			System.out.println(apiURL);
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // ��α��� xml ���
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
