/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unitTest;

import org.junit.Test;
import static org.junit.Assert.*;
import web.home.Register;
/**
 *
 * @author William A Nadeeshani
 */
public class eventIdTest {

    @Test
    public void testEventCodeMultiply() {
        double a = 10.0;
        double b = 5.0;
        
        double expected = 50.0;
        double result = Register.eventCodeMultiply(a, b);
        
        assertEquals(expected, result, 0.00001);
    }
    
}
