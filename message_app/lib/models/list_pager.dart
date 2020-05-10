class ListPager {
  int _currentPage;
  int _totalPage;
  int _total;
  int _nextPage;
  int _pageSize;

  int get currentPage => _currentPage;
  int get totalPage => _totalPage;
  int get total => _total;
  int get nextPage => _nextPage;
  int get paegSize => _pageSize;

  ListPager(int current, int pages, int total, int size) {
    _currentPage = current;
    _totalPage = pages;
    _total = total;
    _pageSize =  size;
    _nextPage = _totalPage > _currentPage ? _currentPage + 1 : 0;
  }
}