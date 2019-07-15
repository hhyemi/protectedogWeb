package org.protectedog.common;

import java.util.Random;

public class AuthKey{
    private int certNumLength = 5;
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        
        int range = (int)Math.pow(10,certNumLength);
        int trim = (int)Math.pow(10, certNumLength-1);
        int result = random.nextInt(range)+trim;
         
        if(result>range){
            result = result - trim;
        }
        
        return String.valueOf(result);
    }

    public int getAuthKeyLength() {
        return certNumLength;
    }

    public void setAuthKeyLength(int certNumLength) {
        this.certNumLength = certNumLength;
    }

}


