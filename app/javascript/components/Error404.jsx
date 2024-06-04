import React from "react";

export default function Error404() {  
  return (
    <div className="container-fluid">
      <div className="container secondary-color">
        <h1 className="display-4">404</h1>        
        <hr className="my-4" />   
        <div className="center-block">
          <img src='/images/image404.jpg' className="img-fluid" alt="page not found" />
        </div>        
      </div>
    </div>
  );
};