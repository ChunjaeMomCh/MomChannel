# 👨‍👩‍👦 '맘채널' JSP 프로그램


![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/3054c13b-8c4c-4a5d-a99f-41775fd7ef54)


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
  
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/d143c9f2-23a2-4e43-8e5f-be24c2611a71)



</details>

<br>

<details>
  <summary>시퀀스 다이어그램</summary>

  1. Actor : 회원 ( Post )
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/bede9070-4422-4788-8f79-61428f1b29eb)

  2. Actor : 회원 ( MyPage, Channel )
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145524819/3e1d72e9-6597-42b8-9ad6-58f7b1293a3d)


  3. Actor : 회원 ( CS )
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/30e7e127-7d20-41f8-b853-8a7bed173d48)

  4. Actor : 관리자
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/91e895c6-7ce4-47b2-b9cd-fe4e7842477f)


</details>

<br>

<details>
  <summary>클래스 다이어그램</summary>

<!-- ![class](https://github.com/kimg1623/Shopping-CLI-Java/assets/145963704/a574220c-39cd-436f-85f4-f3b2600a660c) -->



</details>

<br>

<details>
  <summary>블록 다이어그램</summary>
  
  ![image](https://github.com/LMH9999/MomChannel/assets/145963633/0b770a0c-3e1e-4c7e-a7a3-5d61c010d37e)

</details>

<br>

<details>
  <summary>ER 다이어그램</summary>
  
  ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/6e51e4f2-7afa-4a09-9b06-6b089305d3c9)


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

| 비회원 & 메뉴 |
| --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/13121206-b032-4434-ac04-89ce0e749d0e) | 

| 회원 & 풀다운 메뉴 |
| --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/277d38f9-b958-45a1-a9b8-8722eb52f59e) |

<br>

### [ Main Menu ]
- 맘채널에 관한 소개글 홍보글 등이 보이는 슬라이드 쇼
- 다양한 기준에 대한 게시물 추천

| 슬라이드 쇼 |
| --- |
| ![메인화면_슬라이드쇼](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/9ebf0dbe-4d5d-4d3f-8445-47979eb0d922) |




<br>


### [ 회원 가입 ]
- 회원 가입을 하면 DB의 member 테이블에 입력 받은 정보를 저장합니다.
  - 다음 Open API 를 활용한 주소 입력
  - 아이디 중복체크
  - 이메일 양식 확인
  - 비밀번호 확인
- 회원가입 성공 후 로그인 화면으로 이동

| 회원가입 폼 | 주소 API |
| --- | --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/e5e6a6cf-bcf3-46c6-a63f-c3398527323f) | ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/dc0eb020-d02d-4327-8da7-64af1185b878) |

<br>

| 회원 중복 확인 | 알림 |
| --- | --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/68243652-c894-47a7-9205-972805defbf1)  | ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/d0984377-3bf5-4da0-99a8-aeaabca1d6f8) | 

<br>

| 이메일 양식 | 비밀번호 확인 |
| --- | --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/b92a92a8-e357-4000-b8d9-7e9d003b6007) | ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/1fb77b35-7504-4ada-bda5-9ec7a35b7268) |

<br>






<br>

### [ 로그인 ]
- 회원 로그인은 아이디와 비밀번호를 입력하면 DB의 데이터와 비교하여 일치한 경우 로그인에 성공하고 불일치 시 경고창 표시 후 다시 로그인 창으로 이동

| 로그인 폼| 비밀번호 검증 & 정상 로그인 |
| --- | --- |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/91688597-693c-4ab7-b2f0-be7a282753e2) | ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/06510711-94de-4b2e-8e7e-b880d5dff4e7) <br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/cbab9546-bc10-40b1-aeaf-812efd4d7be8) |

<br>


<br>

#### [ 서비스 안내 ]
- 맘채널 소개
  - 맘채널을 소개하는 포스터
- 공지사항
  - 관리자가 '이벤트 / 공지 / 중요' 카테고리로 나뉜 공지사항을 등록, 수정 및 삭제
- 문의하기
  - 회원이 질문글을 올리고 관리자가 답변을 작성하는 문의하기 게시판

| 맘채널 소개 |
|----------|
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/08df4e92-60de-496b-8f84-5c078ff142f3) |

<br>

| 공지사항 |
|----------|
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/89495355-a6e7-4078-8364-0158ad400d92) |
| 1. 공지 작성 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/4393bacf-f01c-4f09-b75d-9c8bbab26c79) |
| 2. 상세보기 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/47fb1fe8-6d0e-4230-8eae-820b161ac5a7) |
| 3. 수정하기 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/202c6e3f-fbfb-4362-8900-e89f1eb1c432) |

<br>

| 문의하기 |
|----------|
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/3b89f9e1-4694-4508-a782-38ee7b0af1ec) |
| 1. 문의글 작성 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/b75d1c1d-ed5d-4d88-ab50-054d08ca97bd) |
| 2. 상세보기 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/1616099f-bcb8-429c-bd66-fc68d2254f8c) |
| 3. 수정하기 |
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/62c14227-1d43-4e0d-aa30-2f9109324d99) |

<br>

| 관리자 답변 작성 |
|----------|
| ![image](https://github.com/ChunjaeMomCh/MomChannel/assets/145963633/85469769-30c6-4dff-994f-594e2d20b9d0) |

<br>







#### [ 하단 고정 메뉴 ( Footer ) ]
- 팀원들의 GitHub와 회의 내용을 기록한 Notion을 표시

![image](https://github.com/LMH9999/MomChannel/assets/145963633/871a3c12-bd13-429c-87d0-473bc784c109)


<br>



## 5. 프로젝트 후기

### 🍊 김지원

<!-- 코드를 설계할 때 가장 기본이라고 할 수 있는 CRUD를 처음으로 직접 적용해본 경험이었습니다. 만든 코드로 기능을 구현해보고 그것을 DB와 연동하여 IntelliJ에 나타냈지만, DB 구축에는 아직 낯설어 참여하지 못했던 것이 아쉬웠습니다. 프로젝트를 진행하면서 가장 크게 느꼈던 점이 있었습니다. 바로 '완벽'했을 때 비로소 프로젝트가 '완성'된다는 것이었습니다. 예를 들면 부여된 값 외의 다른 값을 입력할 때에도 코딩을 하는 것처럼 모든 상황을 대비할 수 있어야 한다고 생각했습니다. 부족한 부분은 Git과 함께 리뷰를 하면서 조금씩 채워나가겠습니다. -->

<br>

### 👻 이무현

<!-- 이번 프로젝트에서는 CRUD기능을 모두 활용하는 것과 MVC패턴을 적용해보기 위해 노력했다. 화면을 구성하면서 CRUD가 모두 구현이 가능한지 점검했고, 이후 필요한 데이터들로 DB를 구축했는데 실제 개발을 진행하다보니 다시 고쳐야할 부분들이 보였다. 프로젝트 계획이 탄탄해야하는 이유를 경험할 수 있었다. MVC2 패턴을 적용해보고 싶었는데, Controller와 Service의 차이를 이해하는데 어려워서 완벽히 적용은 어려웠지만 시도해봤다는 점이 의미있었다. 처음으로 Git을 제대로 사용해서 진행한 프로젝트였는데, Git협업에 자신감이 조금 생기게 된 것 같다. -->

<br>

### 😎 이양진


<!-- 처음으로 CRUD 기능을 구현하며 데이터베이스와의 상호작용을 경험했다. 화면을 구성하고 각 기능을 완성하며 결합하는 과정에서 예상치 못한 오류들이 발생하였다. 이러한 상황에 대비하여 팀원들과의 협업 과정에서 커뮤니케이션과 주석의 중요성을 느낄 수 있었다. 또한, 프로젝트를 시작하기 전에 요구사항 명세서와 다이어그램을 제작하면서 개발의 전체적인 흐름을 파악할 수 있는 기회였다. 처음 개발 프로젝트를 진행하면서 효율적인 코드 작성과 패키지 및 클래스 분리에 대한 어려움이 있었다. 이러한 부분에 대한 보완이 필요하다고 느꼈다. -->

<br>

