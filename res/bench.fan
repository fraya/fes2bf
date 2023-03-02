class BfMain {
Int pp := 0;
Int dp := 0;
Int[] tape := Int[,].fill(0, 30000);
Void m0 () {
while (tape[dp] != 0) {
dp -= 1;
tape[dp] += 13;
dp += 1;
tape[dp] -= 1;
} // while
} // method

Void m2 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 1;
dp += 1;
tape[dp] += 1;
dp -= 2;
tape[dp] -= 1;
} // while
} // method

Void m3 () {
while (tape[dp] != 0) {
dp -= 1;
tape[dp] += 1;
dp += 1;
tape[dp] -= 1;
} // while
} // method

Void m4 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 8;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m10 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
tape[dp] = 0;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m9 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
m10;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m8 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
m9;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m7 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
m8;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m6 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
m7;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m5 () {
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 10;
m6;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void m1 () {
while (tape[dp] != 0) {
m2;
dp += 1;
m3;
tape[dp] += 8;
m4;
dp += 1;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] = 0;
dp -= 2;
dp += 1;
tape[dp] += 10;
m5;
dp -= 1;
tape[dp] -= 1;
} // while
} // method

Void main () {
dp += 1;
tape[dp] += 2;
m0;
dp -= 1;
m1;
tape[dp] += 10;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
} // main
} // class
