rm -rf build/test/
cd src/main/
javac org/usefullibs/greeter/impl/HelloWorld.java -d ../../build/test/ && echo 'Compiled org.usefullibs.greeter.impl.HelloWorld class!'
cd ../test
javac org/usefullibs/greeter/impl/HelloWorldTest.java -cp ../../build/test/ -d ../../build/test/ && echo 'Compiled org.usefullibs.greeter.impl.HelloWorldTest class!'