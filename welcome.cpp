#include <iostream>
#include <thread>
#include <string>


int main(int argc, char* argv[])
{
    std::string welcomeSongPath = "/welcome.mp3";    
    while(true)
    {
        int result = std::system((std::string("mpg123 ") + welcomeSongPath).c_str());
        if(0 == result)
            std::cout << "I have just WELCOMED you :D\n" << std::flush;
        else
            std::cout << "I tried to Welcome u but failed :(\n" << std::flush;

        std::this_thread::sleep_for(std::chrono::seconds(10));
    }
    return 0;
}