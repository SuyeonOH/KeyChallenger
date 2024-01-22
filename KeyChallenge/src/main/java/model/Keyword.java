package model;

public class Keyword {

	private String id;
    private String keyword;
    
    public Keyword(String id,String keyword ) {
    	super();
    	this.id = id;
    	this.keyword=keyword;
       }
       
       public Keyword() {
       }
        
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}

