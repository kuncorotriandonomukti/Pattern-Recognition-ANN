function key = cvKey(x)
import java.awt.Robot;
import java.awt.event.*;
key = Robot();
% key.setAutoDelay(1000);

key.keyRelease(KeyEvent.VK_A);
key.keyRelease(KeyEvent.VK_S);
key.keyRelease(KeyEvent.VK_D);
key.keyRelease(KeyEvent.VK_W);

if x == 4 % Kiri
    key.keyRelease(KeyEvent.VK_S);
    key.keyRelease(KeyEvent.VK_D);
    key.keyPress(KeyEvent.VK_W);
    key.keyPress(KeyEvent.VK_A);
elseif x == 5 % Mundur
    key.keyRelease(KeyEvent.VK_A);
    key.keyRelease(KeyEvent.VK_D);
    key.keyRelease(KeyEvent.VK_W);
    key.keyPress(KeyEvent.VK_S);
elseif x == 0 % Kanan
    key.keyRelease(KeyEvent.VK_S);
    key.keyRelease(KeyEvent.VK_A);
    key.keyPress(KeyEvent.VK_W);
    key.keyPress(KeyEvent.VK_D);
else
    % Maju
    key.keyRelease(KeyEvent.VK_S);
    key.keyRelease(KeyEvent.VK_D);
    key.keyRelease(KeyEvent.VK_A);
    key.keyPress(KeyEvent.VK_W);
end
