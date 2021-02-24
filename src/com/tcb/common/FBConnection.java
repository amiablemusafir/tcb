package com.tcb.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class FBConnection {
	
	static String accessToken = "";

	public String getFBAuthUrl(int id) {
		String fbLoginUrl = "";
		try {
			String facebook_redirect_url = Setup.FACEBOOK_REDIRECT_URI;
			facebook_redirect_url = facebook_redirect_url.replace("page_id", ""+id);
			fbLoginUrl = "https://www.facebook.com/dialog/oauth?"+"client_id="+ Setup.FACEBOOK_CLIENT_ID + "&redirect_uri="+ URLEncoder.encode(facebook_redirect_url, "UTF-8")+"&scope=email";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbLoginUrl;
	}
}
