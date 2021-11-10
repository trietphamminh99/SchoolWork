#include<iostream>
#include <fstream>
#include <iomanip>
#include"SpellChecker.h"
namespace sdds {
	string SpellChecker::deleteSpace(string data)
	{
		unsigned int flag = 0;
		string dummy{ data };
		//delete space 
		{
			for (size_t i = 0; flag != 1; i++)
			{

				if (dummy[i] == ' ')
				{
					dummy.erase(i, 1);
					i--;
				}
				else
				{
					flag = 1;
				}
			}
			flag = 0;
		}
		return dummy;
	}
	SpellChecker::SpellChecker(const char* filename)
	{
		ifstream file(filename);
		string line = "";
		auto cnt = 0;
		
		
		
			if (!file)
			{
				const char* throwed = "Bad file name!";
				throw throwed;
			}
			else
			{
			
				do {

						std::getline(file, line);
						string dummy{ line };
						string tempVal;
						
						tempVal = dummy.substr(0, dummy.find(' '));
						m_badWords[cnt] = tempVal;
						dummy.erase(0, tempVal.length());

						tempVal = dummy.substr(0, dummy.back());
						m_goodWords[cnt] = deleteSpace(tempVal);
						count[cnt] = 0;
						cnt++;
			
		
				} while (file && cnt <6);
			}
		
	}
	void SpellChecker::operator()(std::string& text)
	{
		
	
		for (size_t i = 0; i < 6; i++)
		{
			while (text.find(m_badWords[i]) != string::npos)
			{
				text.replace(text.find(m_badWords[i]), m_badWords[i].size(), m_goodWords[i]);
				count[i]++;
			}

		}
	}
	void SpellChecker::showStatistics(std::ostream& out) const
	{
		int i;
		out << "Spellchecker Statistics\n";
		for (i = 0; i < 6; ++i)
		{
			out << std::setw(15);
			out << std::setfill(' ');
			out << std::right << m_badWords[i];
			out << ": " << count[i];
			out << " replacements" << endl;
		}
	}
}



