package com.voting.util;

import java.io.*;
import com.sun.image.codec.jpeg.*;
import java.awt.image.*;
import java.awt.*;
import java.applet.*;

import javax.imageio.ImageIO;
//缂╃暐鍥剧被锛�    
//鏈琷ava绫昏兘灏唈pg鍥剧墖鏂囦欢锛岃繘琛岀瓑姣旀垨闈炵瓑姣旂殑澶у皬杞崲銆�    
//鍏蜂綋浣跨敤鏂规硶    
//s_pic(澶у浘鐗囪矾寰�,鐢熸垚灏忓浘鐗囪矾寰�,澶у浘鐗囨枃浠跺悕,鐢熸垚灏忓浘鐗囨枃鍚�,鐢熸垚灏忓浘鐗囧搴�,鐢熸垚灏忓浘鐗囬珮搴�,鏄惁绛夋瘮缂╂斁(榛樿涓簍rue))    
public class ImageZoom {
	String InputDir; //杈撳叆鍥捐矾寰�
	String OutputDir; //杈撳嚭鍥捐矾寰�
	String InputFileName; //杈撳叆鍥炬枃浠跺悕
	String OutputFileName; //杈撳嚭鍥炬枃浠跺悕
	int OutputWidth = 60; //榛樿杈撳嚭鍥剧墖瀹�
	int OutputHeight = 60; //榛樿杈撳嚭鍥剧墖楂�
	int rate = 0;
	boolean proportion = true; //鏄惁绛夋瘮缂╂斁鏍囪(榛樿涓虹瓑姣旂缉鏀�)

	public ImageZoom() {    
		//鍒濆鍖栧彉閲�    
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
				//鍒ゆ柇鏄惁鏄瓑姣旂缉鏀�.    
				//涓虹瓑姣旂缉鏀捐绠楄緭鍑虹殑鍥剧墖瀹藉害鍙婇珮搴�
				double rate1 = ((double) img.getWidth(null)) / (double) OutputWidth + 0.1;
				double rate2 = ((double) img.getHeight(null)) / (double) OutputHeight + 0.1;
				double rate = rate1 > rate2 ? rate1 : rate2;
				new_w = (int) (((double) img.getWidth(null)) / rate);
				new_h = (int) (((double) img.getHeight(null)) / rate);
			} else {
				new_w = OutputWidth; //杈撳嚭鐨勫浘鐗囧搴�    
				new_h = OutputHeight; //杈撳嚭鐨勫浘鐗囬珮搴�    
			}
			try{
				Image src = ImageIO.read(file);
				BufferedImage tag = new BufferedImage((int) new_w, (int) new_h, BufferedImage.TYPE_INT_RGB);   
	            /*  
	             * Image.SCALE_SMOOTH 鐨勭缉鐣ョ畻娉�  鐢熸垚缂╃暐鍥剧墖鐨勫钩婊戝害鐨�  
	             * 浼樺厛绾ф瘮閫熷害楂� 鐢熸垚鐨勫浘鐗囪川閲忔瘮杈冨ソ 浣嗛�熷害鎱�  
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
		//杈撳叆鍥捐矾寰�    
		this.InputDir = InputDir;    
		//杈撳嚭鍥捐矾寰�    
		this.OutputDir = OutputDir;    
		//杈撳叆鍥炬枃浠跺悕    
		this.InputFileName = InputFileName;    
		//杈撳嚭鍥炬枃浠跺悕    
		this.OutputFileName = OutputFileName;    
		return s_pic();    
	}    

	public boolean s_pic100(String InputDir, String OutputDir, String InputFileName, String OutputFileName, int width, int height, boolean gp) {    
		//杈撳叆鍥捐矾寰�    
		this.InputDir = InputDir;    
		//杈撳嚭鍥捐矾寰�    
		this.OutputDir = OutputDir;    
		//杈撳叆鍥炬枃浠跺悕    
		this.InputFileName = InputFileName;    
		//杈撳嚭鍥炬枃浠跺悕    
		this.OutputFileName = OutputFileName;    
		//璁剧疆鍥剧墖闀垮    
		setW_H(width, height);    
		//鏄惁鏄瓑姣旂缉鏀� 鏍囪
		this.proportion = gp;
		return s_pic();
	}
	

	public boolean s_pic300(String InputDir, String OutputDir, String InputFileName, String OutputFileName, int width, int height, boolean gp) {    
		//杈撳叆鍥捐矾寰�    
		this.InputDir = InputDir;    
		//杈撳嚭鍥捐矾寰�    
		this.OutputDir = OutputDir;    
		//杈撳叆鍥炬枃浠跺悕    
		this.InputFileName = InputFileName;    
		//杈撳嚭鍥炬枃浠跺悕    
		this.OutputFileName = OutputFileName;    
		//璁剧疆鍥剧墖闀垮    
		setW_H(width, height);    
		//鏄惁鏄瓑姣旂缉鏀� 鏍囪
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
//		//s_pic(澶у浘鐗囪矾寰�,鐢熸垚灏忓浘鐗囪矾寰�,澶у浘鐗囨枃浠跺悕,鐢熸垚灏忓浘鐗囨枃鍚�,鐢熸垚灏忓浘鐗囧搴�,鐢熸垚灏忓浘鐗囬珮搴�)
//		ImageZoom imageZoom = new ImageZoom();
//		imageZoom.s_pic("E:/", "E:/", "hebe.jpg", "hebwe.jpg", 90, 75, true);
//	}    
}