import React from "react";
import { Link } from "react-router-dom";

export default () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="container secondary-color">
      <h1 className="display-4">News</h1>        
      <hr className="my-4" />
      <Link
        to="/articles"
        className="btn btn-lg custom-button"
        role="button"
      >
        News
      </Link>
    </div>
  </div>
);