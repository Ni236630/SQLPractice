--What grades are stored in the database?
Select * FROM Grade;

--What emotions may be associated with a poem?
Select * FROM Emotion;

--How many poems are in the database?
Select Count(Poem.Id) as NumberOfPoems From Poem;

--Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT TOP 75 Author.Name FROM Author ORDER BY (Author.Name); 

--Starting with the above query, add the grade of each of the authors.
SELECT TOP 75 Author.Name, Author.GradeId 
	FROM Author 
	Left Join Grade on Author.GradeId = Grade.Id
	ORDER BY (Author.Name); 

--Starting with the above query, add the recorded gender of each of the authors.
SELECT TOP 75 Author.Name, Author.GradeId, Gender.Name 
	FROM Author 
	Left Join Grade on Author.GradeId = Grade.Id
	Left Join Gender on Author.GenderId = Gender.Id
	ORDER BY (Author.Name); 

--What is the total number of words in all poems in the database?
Select sum(Poem.WordCount) from Poem;
--Which poem has the fewest characters?
Select Poem.Title, Poem.CharCount from Poem
	Where Poem.CharCount = (
		Select min(Poem.CharCount) 
		from Poem
		);
--How many authors are in the third grade?
Select COUNT(author.id), Grade.Name 
	from Author
		left join Grade 
			on Grade.Id = Author.GradeId
				Where Grade.Id = 3
					Group By Grade.Name;

--How many authors are in the first, second or third grades?
Select COUNT(author.id) as NumberOfAuthors, Grade.Name 
	from Author
		left join Grade 
			on Grade.Id = Author.GradeId
				Where Grade.Id < 4
					Group By Grade.Name;
					
--What is the total number of poems written by fourth graders?
Select COUNT(poem.id) as NumberOfPoems, Grade.Name From Poem
	Left Join Author on Poem.AuthorId = Author.Id
	Left Join Grade on Author.GradeId = Grade.Id
		Where Grade.Id = 4
		Group By Grade.Name; 
		
--How many poems are there per grade?
Select COUNT(poem.id) as NumberOfPoems, Grade.Name From Poem
	Left Join Author on Poem.AuthorId = Author.Id
	Left Join Grade on Author.GradeId = Grade.Id
		Group By Grade.Name
		order by Grade.Name; 

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
Select COUNT(author.id) as NumberOfAuthors, Grade.Name 
	from Author
		left join Grade 
			on Grade.Id = Author.GradeId
					Group By Grade.Name
					Order By Grade.Name;

--What is the title of the poem that has the most words?
Select Top 1 Poem.WordCount, Poem.Title 
	From Poem
		order By Poem.WordCount desc;

--Which author(s) have the most poems? (Remember authors can have the same name.)
Select Count(Poem.AuthorId) as NumberOfPoems , Author.Name
	From Author
		Left Join Poem on Poem.AuthorId = Author.Id
			Group By author.Name
			Order By Count(Poem.AuthorId) desc;

--How many poems have an emotion of sadness?
Select COUNT(Poem.Id) as NumberOfPoems, Emotion.Name
	From Emotion
	Left Join PoemEmotion on Emotion.Id = PoemEmotion.EmotionId
	left Join Poem on Poem.Id = PoemEmotion.PoemId
		Where Emotion.Id = 3
		Group By Emotion.Name;
	

--How many poems are not associated with any emotion?
Select TOP 1 COUNT(Poem.Id) as NumberOfPoems, Emotion.Name 
	From Poem
	Left Join Author on Author.Id = Poem.AuthorId
	Left Join Grade on Author.GradeId = Grade.Id
	Left Join PoemEmotion on Poem.Id = PoemEmotion.PoemId
	Left Join Emotion on Emotion.Id = PoemEmotion.EmotionId
		Group By Emotion.Name
		Order By Emotion.Name;

--Which emotion is associated with the least number of poems?
Select TOP 1 COUNT(Poem.Id) as NumberOfPoems, Emotion.Name
	From Emotion
	Left Join PoemEmotion on Emotion.Id = PoemEmotion.EmotionId
	left Join Poem on Poem.Id = PoemEmotion.PoemId
		Group By Emotion.Name
		Order By NumberOfPoems asc;

--Which grade has the largest number of poems with an emotion of joy?
Select TOP 1 Count(Emotion.Id) as EmotionOfJoy, Grade.Name 
	From Poem
	Left Join Author on Author.Id = Poem.AuthorId
	Left Join Grade on Author.GradeId = Grade.Id
	Left Join PoemEmotion on Poem.Id = PoemEmotion.PoemId
	Left Join Emotion on Emotion.Id = PoemEmotion.EmotionId
		Where Emotion.Id = 4
		Group By Grade.Name
		Order By Grade.Name desc;


	

--Which gender has the least number of poems with an emotion of fear?
Select TOP 1 Count(Emotion.Name) as EmotionOfJoy, Grade.Name 
	From Poem
	Left Join Author on Author.Id = Poem.AuthorId
	Left Join Grade on Author.GradeId = Grade.Id
	Left Join PoemEmotion on Poem.Id = PoemEmotion.PoemId
	Left Join Emotion on Emotion.Id = PoemEmotion.EmotionId
		Where Emotion.Name = 'Fear'
		Group By Grade.Name
		Order By Grade.Name asc;
