import React, { useState, useEffect } from "react";
import axios from 'axios';
import Article from "./Article";

export default function Articles() {
  const [articles, setArticles] = useState([]);
  // const [currentArticle, setCurrentArticle] = useState({})

  useEffect(() => {
    axios.get('/api/v1/articles')
      .then(response => {
        setArticles(response.data);        
      })
      .catch(error => {
        console.error('Error fetching articles:', error);
      });
  }, []);
  return (    
    <div className="container-fluid">

      <div className="container secondary-color">
        <h1 className="display-4">News</h1>        
        <hr className="my-4" />      
      </div>      
      
      <div>
        <h1 className="display-6">News</h1>
        <ul className="list-group">        

        {articles.map(article => (
          <Article key={article.id} {...article} /> 
        ))}

        </ul>
      </div> 
    </div>
  );  
};