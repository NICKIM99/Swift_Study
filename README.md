# Swift_Study
swift_stduy

cococa controls - ios lib 
버전별 차이가 심하군... 

swift의 특징
-> 문장의 끝에 ;이 없다
-> 타입 명도 없다 컴파일러가 알아서 해줌

변수와 상수 선언
var num = 0 -> 변수
let _ratio2 = 123.45 -> 상수
let 한글상수 = "유니코드"

자료형 & 형식 추론
.의 유무에 따라서 float 혹은 double 점 찍은거랑 안 찍은거랑 비교하면 타입 에러 남... 타입 캐스팅이 필요

자료형 명시하는 법
let str = "string"
let str2: String = "string" -> 명시적으로 String이라고 알려주는 것임. 

func loadHtml() -> (code: Int, msg: String){
	return (200, "OK")
}
-> 다중 리턴, 한 함수에서 여러개를 리턴할 수있다. 

문자와 문자열 
char와 String이 다름. 

예외처리
Objective -C와 다르게 예외처리가 생겼다. 

소스파일 
헤더파일과 소스파일이 하나 
