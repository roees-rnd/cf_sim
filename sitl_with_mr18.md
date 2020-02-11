# Crazyflie SITL

## Adding mr18 to SITL

### Background

#### Gazebo communication between processes:

The communication library currently uses the open source `Google Protobuf` for the message serialization and `boost::ASIO` (asynchronous io) for the transport mechanism. It supports the publish/subscribe communication paradigm.

more at: [http://gazebosim.org](http://gazebosim.org/tutorials?tut=architecture&cat=get_started):

**Boost::ASIO** ([https://www.boost.org](https://www.boost.org/doc/libs/1_66_0/doc/html/boost_asio.html)):

Boost.Asio is a cross-platform C++ library for network and low-level I/O programming that provides developers with a consistent asynchronous model using a modern C++ approach.



#### Gazebo plugin:

[gazebo plugin](http://gazebosim.org/tutorials/?tut=plugins_hello_world) : A plugin is a chunk of code that is compiled as a shared library and inserted into the simulation. The plugin has direct access to all the functionality of Gazebo through the standard C++ classes.

search you directory for pluings:

`grep -rnI '<wanted\search\directory>' -e 'plugin name='`

in catkin:



#### The gazebo cfHandler plugin:





#### The `sitl` plugin:





## Connecting GDB



#### Setup:

1. In ***CMakeLists.txt*** add the following:

   ```cmake
   set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")
   ```

2. Obtain the process id (necessary for **gdb**). Place the following lines in your desired file for debugging (in my project was `gazebo_cfHandler_plugin.h`):

   ```cpp
   #include <unistd.h>
   ...
   ...
       
   std::cout << "getpid=" << getpid() << std::endl;
   ```

2. Launch your program (mine was `roslaunch ....`).

3. In a new terminal the run the **GDB** using the following line (substitute your pid):

   ```bash
   gdb --pid <your_pid>
   ```



**<u>Note:</u>** When running inside **docker**, add the following flags to the `docker run`  command:

```bash
--cap-add=SYS_PTRACE --security-opt seccomp=unconfined
```



#### Bebugging Flow (using cli)

Once inside GDB use the following commands:

* To add breakpoint:

   ```bash
   (pdb) break full/path/to/file.cpp:<line number to break on>
   ```
   
* Display text after breaking:

   ```bash
   (pdb) list
   ```
   
* Continue to next breakpoint

   ```bash
   (pdb) cont
   ```
   
* Step one line:

   ```bash
   (pdb) n
   ```
   
* Print a backtrace of the entire stack:

   ```bash
   (pdb) backtrace
   ```
   
* print variables:

   ```bash
   (pdb) print <var name>
   ```
   
* Reassign variables:

   ```bash
   (pdb) set <var_name>=3
   ```

   

