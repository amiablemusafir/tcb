package com.tcb.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
 
public class FTPLoggerThread extends Thread {
 
	public String str;
	public String pageid;
	public void run() {
		String server = "www.thecoderboy.com";
        int port = 21;
        String user = "thecoder";
        String pass = "23@square";
 
        FTPClient ftpClient = new FTPClient();
        try {
 
            ftpClient.connect(server, port);
            ftpClient.login(user, pass);
            ftpClient.enterLocalPassiveMode();
 
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
 
            // APPROACH #1: uploads first file using an InputStream
                       
            SimpleDateFormat sf = new SimpleDateFormat("ddMMyyyyhhmmss");
            String datee = sf.format(new Date());
            
            File file = new File("greeting"+datee+".txt");
            
            FileWriter fileWriter = new FileWriter(file);
			
            fileWriter.write(str);

			fileWriter.flush();
			fileWriter.close();
            
			String firstRemoteFile = "/public_ftp/"+pageid+"/greeting"+datee+".txt";
	           
			 
            System.out.println("Start uploading first file");
            InputStream inputStream = new FileInputStream(file);
            
            boolean done = ftpClient.storeFile(firstRemoteFile, inputStream);
            inputStream.close();
            if (done) {
                System.out.println("The first file is uploaded successfully.");
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