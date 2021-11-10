#define _CRT_SECURE_NO_WARNINGS
#include "StringSet.h"
#include <cstring>
#include <iostream>
#include <fstream>
#include <string>
using namespace std;
namespace sdds {
	 int StringSet::currentStr = 0;
	void StringSet::setNoOfNum()
	{
		string dummystr= {};
		ifstream fileIn;
		int line = 0;
		fileIn.open(m_filename);
		
		if (m_filename == nullptr || !fileIn)
		{
			cout << "Cant read file\n";
		}
		else {

			while (getline(fileIn, dummystr, ' '))
			{
				line++;
			}
			lineValue = line;
		}
		
	

	}
	
	void StringSet::loadText()
	{
		string dummystr;
		ifstream fileIn;
		unsigned int i = 0;
		fileIn.open(m_filename);
		if (fileIn.is_open())
		{



			m_textline = new string[lineValue + 1];

			while (getline(fileIn, dummystr, ' '))
			{
				m_textline[i] = dummystr;
				i++;
				currentStr++;
			}

		}
		else {
			cout << "false to open file\n";
		}
	}
	void StringSet::setFileName(const char* filename)
	{
		if (filename != nullptr)
		{
			m_filename = new char[strlen(filename) + 1];
			strcpy(m_filename, filename);
		}
		

	}
	StringSet::StringSet(const StringSet& filename) 
	{
		*this = filename;
	}

	StringSet::StringSet(const char* filename)
	{
		if (filename != nullptr)
		{
			setFileName(filename);
			setNoOfNum();
			loadText();
		}
		 



	}
	StringSet& sdds::StringSet::operator=(const StringSet& filename)
	{
		if (filename.m_filename != nullptr && this != &filename)
		{

			
			currentStr = filename.currentStr;
			m_textline = new string[currentStr];
			for (size_t i = 0; i < (size_t)currentStr; i++)
			{
				m_textline[i] = filename.m_textline[i];
			}

		}
		return *this;
	}
	size_t StringSet::size()
	{
		return currentStr;
	}

	std::string StringSet::operator[](size_t index)
	{
		string val{ " " };
		
		if (m_textline != nullptr)
		{
			val = m_textline[index];
		}
		

		return val;
	}

	
	



	StringSet::StringSet() :m_textline{nullptr}
	{
		
	}

	StringSet::~StringSet()
	{

	}

	/*Line::operator const char* () const {
		
		return (const char*)m_value;
	}
	Line& Line::operator=(const char* lineValue) {
		delete[] m_value;
		m_value = new char[strlen(lineValue) + 1];
		strcpy(m_value, lineValue);
		return *this;
	}
	Line::~Line() {
		delete m_value;
	}*/

}
