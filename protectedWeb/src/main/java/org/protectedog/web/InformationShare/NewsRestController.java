package org.protectedog.web.InformationShare;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/News/*")
public class NewsRestController {

	/// Field
	
	/// Constructor
	public NewsRestController() {
		System.out.println("NewsRestController Default Constructor");
	}
	
	/// Method
	@RequestMapping(value="json/listNews/")
	public String listNews(Model model) throws Exception{
		
		System.out.println(" ============================== rest listNews ==================================");
		String clientId = "ilVhCqg4sQywtqFTKwUk";
		String clientSecret = "yzKmjY0Bzm";
		String temp = "";
		StringBuffer response = new StringBuffer();
		
		try {
			String text = URLEncoder.encode("반려동물", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text
						+ "&display=5&start=1&sort=date";
				
			System.out.println(apiURL);
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			}
			
			String inputLine;
		
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
				temp += inputLine;
			}
				br.close();
				System.out.println(" end of response : " + response.toString());
			} catch (Exception e) {
				System.out.println(e);
			}
		
		return temp;
	}
}
