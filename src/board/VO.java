package board;

public class VO {
	private int num;			//번호
	private String name;		//이름
	private String password;	//비밀번호
	private String title;		//제목
	private String memo;		//내용
	private String time;		//시간 -- 오류있음
	private int hit;			//조회수
	private int ref;			
	private int indent;			//답글
	private int step;
	private boolean dayNew;
	private String checklist;	
	private String shop;

	public VO() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public boolean isDayNew() {
		return dayNew;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public void setDayNew(boolean dayNew) {
		this.dayNew = dayNew;
	}

	public String getChecklist() {
		return checklist;
	}

	public void setChecklist(String checklist) {
		this.checklist = checklist;
	}
	
	
}
