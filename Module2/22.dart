import 'dart:io';

void main()
{
  try{

    final file=File('hello');
    String content=file.readAsStringSync();
    print(content);
    print("");

  }catch(e){
    print(e);
  }
  try{
    final file=File('hello1');
    String content=file.readAsStringSync();
    print(content);
  }catch(e){
    print(e);
  }
  finally{
    print("Done....");
  }
}