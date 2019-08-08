package org.protectedog.web.InformationShare;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.protectedog.common.Search;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String listNews(Model model, @RequestBody Search search) throws Exception{
		
		System.out.println(" ============================== rest listNews ==================================");
		String clientId = "ilVhCqg4sQywtqFTKwUk";
		String clientSecret = "yzKmjY0Bzm";
		String temp = "";
		StringBuffer response = new StringBuffer();		
		
		System.out.println("searchKeyword before : " + search.getSearchKeyword());
		
		if(search.getSearchKeyword() == "" ) {
			search.setSearchKeyword("반려동물");
		}
		System.out.println("searchKeyword after : " + search.getSearchKeyword());
		
		try {
			String text = URLEncoder.encode(search.getSearchKeyword(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text
						+ "&display=5&start=1&sort=sim";
				
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
