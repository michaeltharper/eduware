  function Application() { 
    return ( 
      <div className="scoreboard">
        <div className="header">
          <h1>Scoreboard</h1>
        </div>

        <div className="players">
          <div className="player">
            <div className="player-name">
              Mike
            </div>
            <div className="player-score">
              <div ClassName="counter">
              <button className="counter-action decrement"> - </button>
              <button className="counter-score"> 123 </button>
              <button className="counter-action increment"> + </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  ReactDOM.render(<Application />, document.getElementById('container') );