function fakePromise(data, duration) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(data);
    }, duration);
  });
}


fakePromise("some data", 3000).then((result) => {
  console.log(result); // 'some data'
});
