package com.voting.util;

import java.io.*;
import com.sun.image.codec.jpeg.*;
import java.awt.image.*;
import java.awt.*;
import java.applet.*;

import javax.imageio.ImageIO;
//缩略图类，    
//本java类能将jpg图片文件，进行等比或非等比的大小转换。    
//具体使用方法    
//s_pic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))    
public class ImageZoom {
	String InputDir; //输入图路径
	String OutputDir; //输出图路径1
	String InputFileName; //输入图文件名
	String OutputFileName; //输出图文件名
	int OutputWidth = 60; //默认输出图片宽
	int OutputHeight = 60; //默认输出图片高
	int rate = 0;
	boolean proportion = true; //是否等比缩放标记(默认为等比缩放)

	public ImageZoom() {    
		//初始化变量    
		InputDir = "";
		OutputDir = "";
		InputFileName = "";
		OutputFileName = "";
		OutputWidth = 60;
		OutputHeight = 60;
		rate = 0;
	}
	public boolean s_pic() {
		File file = new File(InputDir + InputFileName);
		FileOutputStream tempout = null;
		Image img = null;
		Toolkit tk = Toolkit.getDefaultToolkit();    
		Applet app = new Applet();    
		MediaTracker mt = new MediaTracker(app);    
		try {
			img = tk.getImage(InputDir + InputFileName);    
			mt.addImage(img, 0);    
			mt.waitForID(0);    
		} catch (Exception e) {
			e.printStackTrace();    
		}    
	   
		if (img.getWidth(null) == -1) { 
			return false;    
		} else {
			int new_w;
			int new_h;
			if (this.proportion == true) {
				//判断是否是等比缩放.    
				//为等比缩放计算输出的图片宽度及高度
				double rate1 = ((double) img.getWidth(null)) / (double) OutputWidth + 0.1;
				double rate2 = ((double) img.getHeight(null)) / (double) OutputHeight + 0.1;
				double rate = rate1 > rate2 ? rate1 : rate2;
				new_w = (int) (((double) img.getWidth(null)) / rate);
				new_h = (int) (((double) img.getHeight(null)) / rate);
			} else {
				new_w = OutputWidth; //输出的图片宽度     
				new_h = OutputHeight; //输出的图片高度    
			}
			try{
				Image src = ImageIO.read(file);
				BufferedImage tag = new BufferedImage((int) new_w, (int) new_h, BufferedImage.TYPE_INT_RGB);   
				  /*  
	             * Image.SCALE_SMOOTH 的缩略算法  生成缩略图片的平滑度的  
	             * 优先级比速度高 生成的图片质量比较好 但速度慢  
	             */   
				tag.getGraphics().drawImage(src.getScaledInstance(new_w, new_h, Image.SCALE_SMOOTH), 0, 0, null);
				tempout = new FileOutputStream(OutputDir + OutputFileName);
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(tempout);   
				encoder.encode(tag);
				tempout.close();
			} catch (IOException ex) {
				System.out.println(ex.toString());
			}
		}
		return true;
	}    

	public boolean s_pic(String InputDir, String OutputDir, String InputFileName, String OutputFileName) {    
		//输入图路径    
		this.InputDir = InputDir;    
		//输出图路径   
		this.OutputDir = OutputDir;    
		//输入图文件名    
		this.InputFileName = InputFileName;    
		//输出图文件名    
		this.OutputFileName = OutputFileName;    
		return s_pic();    
	}    

	public boolean s_pic100(String InputDir, String OutputDir, String InputFileName, String OutputFileName, int width, int height, boolean gp) {    
		//输入图路径    
		this.InputDir = InputDir;    
		//输出图路径   
		this.OutputDir = OutputDir;    
		//输入图文件名    
		this.InputFileName = InputFileName;    
		//输出图文件名    
		this.OutputFileName = OutputFileName;    
		//设置图片长宽    
		setW_H(width, height);    
		//是否是等比缩放标记
		this.proportion = gp;
		return s_pic();
	}
	

	public boolean s_pic300(String InputDir, String OutputDir, String InputFileName, String OutputFileName, int width, int height, boolean gp) {    
		//输入图路径   
		this.InputDir = InputDir;    
		//输出图路径   
		this.OutputDir = OutputDir;    
		//输入图文件名    
		this.InputFileName = InputFileName;    
		//输出图文件名    
		this.OutputFileName = OutputFileName;    
		//设置图片长宽    
		setW_H(width, height);    
		//是否是等比缩放标记
		this.proportion = gp;
		return s_pic();
	}  

	public void setInputDir(String InputDir) {    
		this.InputDir = InputDir;    
	}
	public void setOutputDir(String OutputDir) {    
		this.OutputDir = OutputDir;    
	}
	public void setInputFileName(String InputFileName) {    
		this.InputFileName = InputFileName;    
	}
	public void setOutputFileName(String OutputFileName) {    
		this.OutputFileName = OutputFileName;    
	}
	public void setOutputWidth(int OutputWidth) {    
		this.OutputWidth = OutputWidth;    
	}
	public void setOutputHeight(int OutputHeight) {    
		this.OutputHeight = OutputHeight;
	}
	public void setW_H(int width, int height) {    
		this.OutputWidth = width;    
		this.OutputHeight = height;    
	}

//	public static void main(String[] a) {    
//		//s_pic(大图片路径1�7,生成小图片路径,大图片文件名,生成小图片文各,生成小图片宽度,生成小图片高度)
//		ImageZoom imageZoom = new ImageZoom();
//		imageZoom.s_pic("E:/", "E:/", "hebe.jpg", "hebwe.jpg", 90, 75, true);
//	}    
}