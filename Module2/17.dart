class Book
{

  var title,author,publishYear;
  Book(String title,String Author,int publishYear)
  {
    this.title=title;
    this.author=Author;
    this.publishYear=publishYear;
  }

  checkOld(){
    var year=2026-publishYear;

    if(year>10){
      
      print("Book is over 10 year old.");
      print("* * * * * * * * * *");
    }else{
      print("Book is not over 10 year old.");
      print("* * * * * * * * * *");

    }
    
  }

  display(){
    print("");
    print("* * * * * * * * * *");
    print("Title : $title");
    print("Author : $author");
    print("Publish Year : $publishYear");
  }

}

void main(){

  var book1=Book('The Alchemist', 'Paulo Coelho', 1988);
  book1.display();
  book1.checkOld();
  var book2=Book('Harry Potter and the Philosopher’s Stone', 'J.K. Rowling', 1997);
  book2.display();
  book2.checkOld();
  var book3=Book('The Hobbit', 'J.R.R. Tolkien', 1937);
  book3.display();
  book3.checkOld();
  var book4=Book('Wings of Fire', 'A. P. J. Abdul Kalam', 1999);
  book4.display();
  book4.checkOld();
  var book5=Book('Atomic Habits', 'James Clear', 2018);
  book5.display();
  book5.checkOld();

}