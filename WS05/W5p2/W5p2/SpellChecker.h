#pragma once
#ifndef SPELLCHECKER_H
#define SPELLCHECKER_H
#include <string>
using namespace std;
const int maxCount = 6;
namespace sdds {
	class SpellChecker {
		string m_badWords[6];
		string m_goodWords[6];
		size_t count[maxCount] = {0};
		string deleteSpace(string data);
	public:
		SpellChecker(const char* filename);
		void operator()(std::string& text);
		void showStatistics(std::ostream& out) const;
	};
}



#endif // !SPELLCHECKER_H
