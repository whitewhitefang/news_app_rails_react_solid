import React from "react";
import { Link } from "react-router-dom";

export default function Article(props) {
  return (
    <li className="list-group-item">
      <h3>{props.header}</h3>
      <div>
        {props.image_url && <img src={props.image_url} alt={props.header} />}
      </div>
      <div>
        <p>{props.body}</p>
        <Link
          to={`/articles/:${props.id}`}
          className="btn btn-sm btn-primary"
          role="button"
        >
          Read more
        </Link>
      </div>
    </li>          
  );
};