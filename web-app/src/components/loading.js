import React from "react";
import Loader from 'react-loader-spinner'

function Loading() {
  return (
    <div className="loader center">
      <Loader
      type="Puff"
      color="#00BFFF"
      height={100}
      width={100}
      timeout={3000} //3 secs
      />
    </div>
  );
}

export default Loading;
