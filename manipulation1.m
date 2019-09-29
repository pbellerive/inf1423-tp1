clear all;

N = 4;
n1 = 2;
data = [0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0];
result = lz77(data, N, n1);
disp(result);

N = 8;
n1 = 4;
data = [0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0];
result = lz77(data, N, n1);
disp(result);

N = 16;
n1 = 8;
data = [0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0];
result = lz77(data, N, n1);
disp(result);

N = 32;
n1 = 16;
data = [0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0];
result = lz77(data, N, n1);
disp(result);