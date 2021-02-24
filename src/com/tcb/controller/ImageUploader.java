package com.tcb.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import com.tcb.common.Setup;

public class ImageUploader {
	
	public int uploadImage(String app_id, String foldername, String tstr_image_url) {  
		
		// write the image to a file
   	 	String server = Setup.HOST_NAME;
        int port = Setup.PORT;
        String user = Setup.USERNAME;
        String pass = Setup.PASSWORD;
 
        FTPClient ftpClient = new FTPClient();
        try {
 
               ftpClient.connect(server, port);
               ftpClient.login(user, pass);
               ftpClient.enterLocalPassiveMode();
 
               ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		    			    	
		    	URL url;
				try {
					 String url_details = "https://graph.facebook.com/"+app_id+"/picture?type=large&width=400&height=400";
					 System.out.println("URL ::"+url_details);
					 url = new URL(url_details);
					 					
					 
					 String firstRemoteFile = "/public_html/"+tstr_image_url;
					 InputStream inputStream = new BufferedInputStream(url.openStream());
			    	 // APPROACH #2: uploads file using an OutputStream
					
		             System.out.println("Start uploading file");
		             OutputStream outputStream = ftpClient.storeFileStream(firstRemoteFile);
		             byte[] bytesIn = new byte[4096];
		             int read = 0;
		 
		             while ((read = inputStream.read(bytesIn)) != -1) {
		                outputStream.write(bytesIn, 0, read);
		             }
		             inputStream.close();
		             outputStream.close();
		 
		             boolean completed = ftpClient.completePendingCommand();
		             if (completed) {
		                System.out.println("The file is uploaded successfully.");
		             }
	            
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	 
	        } catch (IOException ex) {
	            System.out.println("Error: " + ex.getMessage());
	            ex.printStackTrace();
	        } finally {
	            try {
	                if (ftpClient.isConnected()) {
	                    ftpClient.logout();
	                    ftpClient.disconnect();
	                }
	            } catch (IOException ex) {
	                ex.printStackTrace();
	            }
	        }
        	return 1;
	  }  
}
