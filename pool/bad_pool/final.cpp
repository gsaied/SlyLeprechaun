#include <iostream>
using namespace std ; 
int main (){

	for (int i = 0 ; i<63 ; i=i+16 ) {
		//cout<<")"; 
	//	cout<<"in"<<i<<"+(";	
	//	cout <<"reg [15:0] u"<<i<<";"<<endl ;
		cout <<"kamal"<<i<<"<="<<"(hazem"<<i<<"+hazem"<<i+8<<");"<<endl;  
	}	

	for (int i = 0 ; i<63 ; i=i+16 ) {
		//cout<<")"; 
	//	cout<<"in"<<i<<"+(";	
		cout <<"reg [15:0] kamal"<<i<<";"<<endl ;
		//cout <<"u"<<i<<"<="<<"(in"<<i<<"+in"<<i+1<<");"<<endl;  
	}	
}

