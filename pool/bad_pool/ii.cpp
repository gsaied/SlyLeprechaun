#include <iostream> 
using namespace std ; 
int main () {
	for (int i = 1 ; i < 5 ; i++){
		cout<<"t"<<i<<" = " ;
		for (int j = (i-1)*16 ; j < i*16 ; j++){
			cout<<"in"<<j<< "+" ; 
		}
		cout<<endl; 
	}
}
