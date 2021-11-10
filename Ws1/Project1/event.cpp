#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <iomanip>
#include "event.h"
#include <cstring>

//PHAM MINH TRIET
//ID:157930199

using namespace std;


unsigned int g_sysClock = 0;


namespace sdds
{
	//constructor
	Event::Event() {
		secMidnight = 0;
		description = nullptr;
	}


	//calculates time in seconds to HH:MM::SS format and displays.
	void Event::display() {


		static int counter = 1;


		int hour = 0;
		int min = 0;
		int sec = 0;


		hour = secMidnight / 3600;
		min = (secMidnight - (hour * 3600)) / 60;
		sec = (secMidnight - (hour * 3600) - (min * 60));


		cout<< setw(2)<< setfill(' ')<< counter++<< ". ";


		if (description != nullptr && description[0] != '\0') {
			cout<< setw(2)<< setfill('0')<< hour<< ":" << setw(2)<< setfill('0')<< min<< ":" << setw(2)<< setfill('0')<< sec<< " => " << description<< endl;
			//	cout << "[ No Event ]" << endl;
		}
		else {
			cout<< "| No Event |" << endl;
		}
	}




	// basically copy constructor
	void Event::set(const char* src) {


		if (src != nullptr && src[0] != '\0') {

			description = new char[strlen(src) + 1];
			strcpy(description, src);
			secMidnight = g_sysClock;
		}
		else {
			delete description;
		}
	}
	void Event::set() 
		{
			
			description = nullptr;
			secMidnight = 0;
		}

	Event::~Event() {
	
	}


}


