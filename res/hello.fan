class BfMain { 
Int pp := 0;
Int dp := 0;
Int[] tape := Int[,].fill(0, 30000);
Void main() {
tape[dp] += 10;
while (tape[dp] != 0) {
dp += 1;
tape[dp] += 7;
dp += 1;
tape[dp] += 10;
dp += 1;
tape[dp] += 3;
dp += 1;
tape[dp] += 1;
dp -= 4;
tape[dp] -= 1;
}
dp += 1;
tape[dp] += 2;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp += 1;
tape[dp] += 1;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] += 7;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] += 3;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp += 1;
tape[dp] += 2;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp -= 2;
tape[dp] += 15;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp += 1;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] += 3;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] -= 6;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
tape[dp] -= 8;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp += 1;
tape[dp] += 1;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
dp += 1;
Env.cur.out.writeChar(tape[dp]);
Env.cur.out.flush;
} // main
} // class
