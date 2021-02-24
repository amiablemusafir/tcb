package com.tcb.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.imageio.ImageIO;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import sun.misc.BASE64Decoder;

import com.tcb.common.Setup;

public class ContentUploader {
	
	public void uploadImage(String app_id, String folder_name, String image_details, String str_date) {  
		
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
		    	
               // create a buffered image
  			   BufferedImage image = null;
  			   byte[] imageByte;
  	
  			   BASE64Decoder decoder = new BASE64Decoder();
  			   imageByte = decoder.decodeBuffer(image_details);
  			   ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
  			   image = ImageIO.read(bis);
  			   bis.close();
  	
  			   // write the image to a file
  			   File outputfile = new File("image.jpg");
  			   ImageIO.write(image, "png", outputfile);
  			 
  			   String firstRemoteFile = "/public_html/"+folder_name+"/details"+app_id+""+str_date+".jpg";
			   OutputStream outputStream = ftpClient.storeFileStream(firstRemoteFile);
  			   outputStream.write(imageByte);
  			   outputStream.close();
  			   System.out.println("Start uploading file");
		            
		 
		       boolean completed = ftpClient.completePendingCommand();
		       if (completed) {
		           System.out.println("The file is uploaded successfully.");
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
	  }  
}
