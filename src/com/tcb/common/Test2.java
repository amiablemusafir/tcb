package com.tcb.common;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
 


import java.net.MalformedURLException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
 
/**
 * A program that demonstrates how to upload files from local computer
 * to a remote FTP server using Apache Commons Net API.
 * @author www.codejava.net
 */
public class Test2 {
 
    public static void main(String[] args) {
    	 // write the image to a file
    	 String server = "www.xamdesk.com";
         int port = 21;
         String user = "xamdeskc";
         String pass = "23@square";
  
         FTPClient ftpClient = new FTPClient();
         try {
  
                ftpClient.connect(server, port);
                ftpClient.login(user, pass);
                ftpClient.enterLocalPassiveMode();
  
                ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		    			    	
		    	URL url;
				try {
					 url = new URL("https://graph.facebook.com/1868050859873506/picture?type=large&w‌​idth=400&height=400");
					 					
					 
					 String firstRemoteFile = "/public_html/image/abc.jpg";
					 InputStream inputStream = new BufferedInputStream(url.openStream());
			    	 // APPROACH #2: uploads second file using an OutputStream
					
		             System.out.println("Start uploading second file");
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
		                System.out.println("The second file is uploaded successfully.");
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
    }
 
}