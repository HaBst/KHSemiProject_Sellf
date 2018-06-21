package product.model.vo;

import java.sql.Timestamp;

public class ImageFile {
	private String userId;
	private String fileNewName;
	private String fileOriginName;
	private String filePath;
	private long fileSize;
	private Timestamp uploadTime;	
	
	public ImageFile(String fileNewName, String fileOriginName, String filePath, long fileSize, String userId, Timestamp uploadTime) {
		this.fileNewName = fileNewName;
		this.fileOriginName = fileOriginName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.uploadTime = uploadTime;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFileNewName() {
		return fileNewName;
	}
	public void setFileNewName(String fileNewName) {
		this.fileNewName = fileNewName;
	}
	public String getFileOriginName() {
		return fileOriginName;
	}
	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	
	
}
