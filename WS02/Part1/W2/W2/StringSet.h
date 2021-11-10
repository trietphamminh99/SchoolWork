#ifndef STRINGSET_H
#define STRINGSET_H
#include <iostream>
#include <string>
using namespace std;

namespace sdds {
	

	class StringSet {
		string* m_textline;
		char* m_filename{ nullptr };
		unsigned int lineValue;
		static int currentStr;
		void setFileName(const char* filename);
		void setNoOfNum();
		void loadText();
	public:
		StringSet() ;
		StringSet(const char* filename);
		StringSet(const StringSet& filename);
		StringSet& operator=(const StringSet& filename);

		size_t size();
		std::string operator[](size_t);
		
		 virtual ~StringSet();
	};
	
}





#endif // !STRINGSET_H
