abstract class CorePolicy<T>
{
  bool canViewList(Type type);
  bool canCreate(Type type);
  bool canUpdate(T object);
  bool canDelete(T object);
}