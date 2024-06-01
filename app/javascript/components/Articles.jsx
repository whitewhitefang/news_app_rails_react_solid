import React from "react";
import { Link } from "react-router-dom";
import axios from 'axios';

const Articles = () => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    axios.get('/api/v1/articles')
      .then(response => {
        setArticles(response.data);
      })
      .catch(error => {
        console.error('Error fetching articles:', error);
      });
  }, []);

  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <h1 className="display-4">News</h1>
      {articles.map(article => (
        <li key={article.id}>
          <h3>{article.header}</h3>
          <div>
            {article.image && <img src={article.image} alt="" />}
          </div>
          <div>
            <p>{article.body}</p>
            <Link
              to={`/articles/show/${article.id}`}
              className="btn btn-lg"
              role="button"
            >
              Read more
            </Link>
          </div>

        </li>
      ))}
  </div>
};

export default Articles;