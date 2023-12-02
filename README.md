# 👨‍👩‍👦 '맘채널' JSP 프로그램

![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/de76197b-ea4a-4f3b-9ce7-259cc508b6fb)



<br>

## 프로젝트 소개

- 학부모 정보 공유 커뮤니티
- 회원으로 로그인하면 공유하고 싶은 정보들을 게시판에 등록하고, 학년별, 지역별로 구분해 볼 수 있습니다.
- 관리자는 공지사항을 관리하고,  문의하기 게시판 회원의 질문 글에 답변을 작성할 수 있습니다.

<br>

## 팀원 구성과 역할

<div align="center">

| **김지원** | **이무현** | **이양진** |
| :------: | :------: | :------: |
| [<img src="https://avatars.githubusercontent.com/u/40616792?v=4" height=150 width=150> <br/> @kimg1623](https://github.com/kimg1623) | [<img src="https://avatars.githubusercontent.com/u/145963633?v=4" height=150 width=150> <br/> @lmh9999](https://github.com/LMH9999) | [<img src="https://avatars.githubusercontent.com/u/145524819?v=4" height=150 width=150> <br/> @Lzynee](https://github.com/Lzynee) |
| 상품전체보기<br>상품상세조회<br>관리자 로그인<br>기능 구현 | 관리자 기능 구현<br>구현 기능 연결| DB 구축 및 Query 작성<br>주문/배송 조회<br>내정보확인<br>기능 구현 |

</div>

<br>

## 1. 개발 환경

**Language** 
<div>
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"> 
<img src="https://img.shields.io/badge/Mybatis-000000?style=for-the-badge&logo=Fluentd&logoColor=fff"/><br>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=fff"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=fff"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=000"/>
</div> 
<br>

**Tools** 
<div>
<img src="https://img.shields.io/badge/IntelliJIDEA-000000?style=for-the-badge&logo=intellijidea&logoColor=white"></div>  
<br>

**Collaboration** 
<div>
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white">
<img src="https://img.shields.io/badge/gitkraken-179287?style=for-the-badge&logo=gitkraken&logoColor=white">
<img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white">
</div>
<br>

## 2. 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2023-11-20 ~ 2023-12-06
- 기획 : 2023-11-20 ~ 2023-11-24
- 기능 구현 : 2023-11-25 ~ 2023-12-04

<br>

### 작업 관리

- GitHub로 코드 형상관리를 하고, 기능별로 branch를 분리하여 협업을 진행했습니다.
- Slack을 사용하여 프로젝트 진행상황을 공유하고 Notion에 회의 회의 내용을 기록했습니다.

<br>

## 3. 요구사항 명세 및 다이어그램

<details>
  <summary>요구사항 명세서</summary>

  1. 공통 및 메인화면
  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/a37e28d0-d9cf-4776-9f90-8a23de130f9c)

  2. 학부모 정보 공유 게시판
   ![image](https://github.com/LMH9999/MomChannel/assets/145963633/d770a942-9245-4023-9480-1905d4c6914d)

  3. 공지사항 게시판
   ![image](https://github.com/LMH9999/MomChannel/assets/145963633/eb2138f7-a46e-4dc7-93e4-09dad58f5f22)

  4. 문의하기 게시판
   ![image](https://github.com/LMH9999/MomChannel/assets/145963633/16f39925-86b9-4b60-acbe-aea63d44a965)
  
  5. 로그인
  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/9a3547b4-8289-40a1-b465-74fcb4307b44)

  6. 회원가입 
  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/aeb9bcad-2557-4e08-8a00-deee7c378537)


</details>

  
<br>

<details>
  <summary>유스케이스 다이어그램</summary>

 ![image (4)](https://github.com/jyeeeh/Shopping-CLI-Java/assets/145963612/a04ebb93-1788-4e51-98d7-df8a6b5d033b)



</details>

<br>

<details>
  <summary>시퀀스 다이어그램</summary>

  1. Actor : 회원
  ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/288f651e-bcb9-43cb-b96b-845c0ed1aa15)

  
  
  3. Actor : 관리자
  ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/ca35abda-51d9-4136-b2bf-62bf1b17337c)


</details>

<br>

<details>
  <summary>클래스 다이어그램</summary>

![class](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963704/a574220c-39cd-436f-85f4-f3b2600a660c)



</details>

<br>

<details>
  <summary>블록 다이어그램</summary>

  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/0b770a0c-3e1e-4c7e-a7a3-5d61c010d37e)

</details>

<br>

<details>
  <summary>ER 다이어그램</summary>
  
  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/b28899ae-247f-4538-b150-9f905200b356)

</details>

<br>


## 4. 구현 기능

### [ 상단 고정 메뉴 ( Header ) ]
- 누르면 메인 페이지로 이동시켜주는 로고
- 게시물 검색 기능
- 로그인이 되어 있지 않은 경우
  - 회원가입
  - 로그인
- 로그인이 되어 있는 경우
  - 내 정보 보기로 이동가능한 프로필 사진
  - 로그인 한 회원님의 아이디 표시
  - 로그아웃 
- 게시판의 종류와 공지사항 문의하기 게시판을 갈 수 있는 풀다운 메뉴

| 초기화면 | 회원 로그인 화면 |
| --- | --- |
| ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/0ada0842-b780-4db9-87d2-e84ca17faa16) | ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/a82d09a7-5722-4ebe-94ea-87fcf39163f7) |


<br>

### [ Main Menu ]
- 맘채널에 관한 소개글 홍보글 등이 보이는 슬라이드 쇼
- 다양한 기준에 대한 게시물 추천
  
  ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/98e02ab3-449e-45a8-a302-17280991e456)


<br>


### [ 회원 가입 ]
- 회원 가입을 하면 DB의 member 테이블에 입력 받은 정보를 저장합니다.
  - 아이디 중복체크
  - 비밀번호 확인
  - 다음 Open API 를 활용한 주소 입력
- 회원가입 성공 후 로그인 화면으로 이동
  
  ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/98e02ab3-449e-45a8-a302-17280991e456)


<br>

### [ 로그인 ]
- 회원 로그인은 아이디와 비밀번호를 입력하면 DB의 데이터와 비교하여 일치한 경우 로그인에 성공하고 불일치 시 경고창 표시 후 다시 로그인 창으로 이동

| 패스워드 불일치 | 미등록 아이디 |
| --- | --- |
| ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/f3e5f591-4a23-4344-9ded-7bdb9ea82821) | ![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/b99398b4-648d-4225-9689-85a1d172741d)|


<br>

#### [ 서비스 안내 ]
- 맘채널 소개
  - 맘채널을 소개하는 포스터
- 공지사항
  - 관리자가 '이벤트 / 공지 / 중요' 카테고리로 나뉜 공지사항을 등록, 수정 및 삭제
- 문의하기
  - 회원이 질문글을 올리고 관리자가 답변을 작성하는 문의하기 게시판

| 상품전체보기 |
|----------|
|![image](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963790/c0801a23-3e3a-4c2a-8c12-162d39f1b70f)|

<br>



#### [ 하단 고정 메뉴 ( Footer ) ]
- 팀원들의 GitHub와 회의 내용을 기록한 Notion을 표시

![image](https://github.com/LMH9999/MomChannel/assets/145963633/871a3c12-bd13-429c-87d0-473bc784c109)


<br>



## 5. 프로젝트 후기

### 🍊 김지원

코드를 설계할 때 가장 기본이라고 할 수 있는 CRUD를 처음으로 직접 적용해본 경험이었습니다. 만든 코드로 기능을 구현해보고 그것을 DB와 연동하여 IntelliJ에 나타냈지만, DB 구축에는 아직 낯설어 참여하지 못했던 것이 아쉬웠습니다. 프로젝트를 진행하면서 가장 크게 느꼈던 점이 있었습니다. 바로 '완벽'했을 때 비로소 프로젝트가 '완성'된다는 것이었습니다. 예를 들면 부여된 값 외의 다른 값을 입력할 때에도 코딩을 하는 것처럼 모든 상황을 대비할 수 있어야 한다고 생각했습니다. 부족한 부분은 Git과 함께 리뷰를 하면서 조금씩 채워나가겠습니다.

<br>

### 👻 이무현

이번 프로젝트에서는 CRUD기능을 모두 활용하는 것과 MVC패턴을 적용해보기 위해 노력했다. 화면을 구성하면서 CRUD가 모두 구현이 가능한지 점검했고, 이후 필요한 데이터들로 DB를 구축했는데 실제 개발을 진행하다보니 다시 고쳐야할 부분들이 보였다. 프로젝트 계획이 탄탄해야하는 이유를 경험할 수 있었다. MVC2 패턴을 적용해보고 싶었는데, Controller와 Service의 차이를 이해하는데 어려워서 완벽히 적용은 어려웠지만 시도해봤다는 점이 의미있었다. 처음으로 Git을 제대로 사용해서 진행한 프로젝트였는데, Git협업에 자신감이 조금 생기게 된 것 같다.

<br>

### 😎 이양진


처음으로 CRUD 기능을 구현하며 데이터베이스와의 상호작용을 경험했다. 화면을 구성하고 각 기능을 완성하며 결합하는 과정에서 예상치 못한 오류들이 발생하였다. 이러한 상황에 대비하여 팀원들과의 협업 과정에서 커뮤니케이션과 주석의 중요성을 느낄 수 있었다. 또한, 프로젝트를 시작하기 전에 요구사항 명세서와 다이어그램을 제작하면서 개발의 전체적인 흐름을 파악할 수 있는 기회였다. 처음 개발 프로젝트를 진행하면서 효율적인 코드 작성과 패키지 및 클래스 분리에 대한 어려움이 있었다. 이러한 부분에 대한 보완이 필요하다고 느꼈다.

<br>

