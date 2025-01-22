# somm24nm
SO/FSO  Simulating a uniprocessor scheduler, contiguous memory allocation system

******
******

## Prerequisites

On Ubuntu you need the following packages installed: 
_build-essential_, _cmake_, _doxygen_.

```
sudo apt install build-essential cmake doxygen
```
In other Linux distributions you need equivalent packages installed.

******

## Installing

In a directory of your choice, unpack the tarball file

```
cd «directory-of-your-choice»
tar xvzf somm24nm.tgz
```

******

## Generating documentation

The code is documented in **doxygen**. So, you can easily generate **html** documentation pages.

```
cd «directory-of-your-choice»
cd somm22nm/doc
doxygen
```
Then, you can display the pages running (inside the **doc** directory)

```
firefox html/index.html &
```

Of course, you can replace _firefox_ with your favorite browser.

******

## Preparing the compilation environment

In a terminal, enter the base directory of your project, create the **build** directory,
and use _cmake_ to prepare _make_

```
cd «directory-of-your-choice»
cd somm24nm
mkdir build
cd build
cmake ../src
```

If you prefer _ninja_, instead of _make_,

```
cd «directory-of-your-choice»
cd somm24nm
mkdir build
cd build
cmake -G Ninja ../src
```

******

## Building the code

In a terminal, enter the **build** directory of your project and run _make_ or _ninja_

```
cd «directory-of-your-choice»
cd somm24nm/build
make
```
or

```
cd «directory-of-your-choice»
cd somm22nm/build
ninja
```
******

## Testing the code

After building the code, a program will be put in the <tt>somm22-dz/bin</tt> directory.

Of course you can write your own testing programs. Do not forget to edit appropriately
the main <tt>CMakeList.txt</tt> file.


