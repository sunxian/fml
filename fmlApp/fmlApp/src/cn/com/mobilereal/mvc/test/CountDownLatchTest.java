package cn.com.mobilereal.mvc.test;

import java.util.concurrent.CountDownLatch;

import org.junit.Test;


public class CountDownLatchTest {
	@Test
	public void test() throws Exception {
	    int count = 10;
	   
	    final CountDownLatch l = new CountDownLatch(count);
	    for(int i = 0; i < count; ++i) {  
	        final int index = i;
	        new Thread(new Runnable() {
	            @Override
	            public void run() {
	                try {
	                    Thread.currentThread().sleep(20 * 1000);
	                } catch (InterruptedException e) {
	                    e.printStackTrace();
	                }
	                System.out.println("thread " + index + " has finished...");
	                l.countDown();
	            }
	        }).start();
	    }
	    try {
	        l.await();
	    } catch (InterruptedException e) {
	        e.printStackTrace();
	    }
	    System.out.println("now all threads have finished");
	}
}
