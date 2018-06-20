package board.model.vo;

public class Faq 
{
	private int faq_pk;
	private String faq_subject; 
	private String faq_image;
	private String faq_content;
	
	public Faq(){}
	
	public Faq(int faq_pk, String faq_subject, String faq_image, String faq_content) {
		
		this.faq_pk = faq_pk;
		this.faq_subject = faq_subject;
		this.faq_image = faq_image;
		this.faq_content = faq_content;
	}

	public int getFaq_pk() {
		return faq_pk;
	}

	public void setFaq_pk(int faq_pk) {
		this.faq_pk = faq_pk;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_image() {
		return faq_image;
	}

	public void setFaq_image(String faq_image) {
		this.faq_image = faq_image;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
}
