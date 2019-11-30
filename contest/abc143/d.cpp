#include <iostream>
#include <cmath>
using namespace std;

#define rep(i,n) for (int i = 0; i < (n); ++i)
#define chmax(a,b) if ((a) < (b)) { a = (b); }

int main() {
  int n;
  int a[2005];
  cin >> n;
  rep(i, n) {
    cin >> a[i];
  }
  int u, l;
  int ans = 0;
  for (int i = 0; i < n - 2; i++) {
    for (int j = i + 1; j < n - 1; j++) {
      if (a[i] - a[j] < a[j] - a[i]) {
        l = a[j] - a[i];
      } else {
        l = a[i] - a[j];
      }
      u = a[i] + a[j];
      for (int k = j + 1; k < n; k++) {
        if (l < a[k] && a[k] < u) ans++;
      }
    }
  }
  cout << ans << endl;
  return 0;
}
